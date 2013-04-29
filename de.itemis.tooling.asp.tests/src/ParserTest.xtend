

import com.google.inject.Inject
import de.itemis.tooling.asp.ASPInjectorProvider
import de.itemis.tooling.asp.aSP.Program
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ASPInjectorProvider))
class ParserTest {

	@Inject extension ParseHelper<Program>
	@Inject extension ValidationTestHelper

//		val builder=SaveOptions::newBuilder
//		builder.format
//		model.eResource.save(System::out,builder.options.toOptionsMap)

	@Test
	def void testSimpleProgram() {
		":-.".noError
		":-p.".noError
		":-p,q.".noError
		":-p,q,r.".noError

		"p.".noError
		"p:-.".noError
		"p:-q.".noError
		"p:-q,r.".noError
		"p:-q,r,s.".noError
		"p|q:-.".noError
		"p|q|r:-.".noError

		"p:-not q.".noError
		"p:-not q, not r.".noError
		"p:-q, not r, s, not t.".noError
	}

	@Test
	def void testSimpleFact() {
		"bird.".noError
		"bird().".noError
		"bird(tweety).".noError
		'''bird("tweety").'''.noError
		"p(1).".noError
		"p(_).".noError
		"p(X).".noError
	}

	@Test
	def void testBuiltin() {
		":- f<g.".noError
		":- f(Y)<g.".noError
		''':- f(1,h(2,"fdf",X,j(_,2*7+3)))<g.'''.noError
	}

	def noError(CharSequence model){
		val semantic=model.parse
//		semantic.eAllContents.forEach[println(it)]
		//possibleLogging
		semantic.assertNoIssues
		semantic
	}
}
