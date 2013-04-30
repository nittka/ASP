package de.itemis.tooling.asp.parsing

import de.itemis.tooling.asp.AspTest
import org.junit.Test
import javax.inject.Inject
import de.itemis.tooling.asp.service.TermExtension
import org.eclipse.emf.ecore.EObject
import de.itemis.tooling.asp.aSP.Function
import org.junit.Assert

/**
 * proof of concept tests for checking whether functions are correctly recognisable as literals
 * in order to facilitate the tests, we assume that a function name appears at most once
 */
class LiteralRecognitionTest extends AspTest{

	@Inject
	extension TermExtension e

	@Test
	def void testSimpleProgram() {
		"p.".noError.assertLiteral("p")
		"p:-q.".noError.assertLiteral("q")
		"p:-q,r.".noError.assertLiteral("r")
		"p|q|r:-.".noError.assertLiteral("q")
		"p|-q|r:-.".noError.assertLiteral("q")
		"p:-not q, not r.".noError.assertLiteral("r")
	}


	@Test
	def void testSimpleFact() {
		"bird().".noError.assertLiteral("bird")
		"bird(tweety).".noError.assertNotLiteral("tweety")
	}

	@Test
	def void testBuiltin() {
		":- f<g.".noError.assertNotLiteral("f")
		":- f<g.".noError.assertNotLiteral("g")
	}


	def private assertLiteral(EObject o, String literalName){
		val f=o.firstFunctionByName(literalName)
		Assert::assertTrue(f.literal)
	}
	def private assertNotLiteral(EObject o, String literalName){
		val f=o.firstFunctionByName(literalName)
		Assert::assertFalse(f.literal)
	}

	def private firstFunctionByName(EObject o, String literalName){
		o.eAllContents.filter(typeof(Function)).findFirst[name==literalName]
	}
}
