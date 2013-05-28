package de.itemis.tooling.asp.parsing

import org.junit.Test

class RuleTest extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testRuleStructure(){
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
}