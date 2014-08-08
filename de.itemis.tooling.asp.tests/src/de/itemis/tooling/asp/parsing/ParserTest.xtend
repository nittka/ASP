package de.itemis.tooling.asp.parsing

import de.itemis.tooling.asp.AspTest
import org.junit.Test

/** 
 * test that valid programs are parsed without raising errors
 * */
class ParserTest extends AspTest{

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
}
