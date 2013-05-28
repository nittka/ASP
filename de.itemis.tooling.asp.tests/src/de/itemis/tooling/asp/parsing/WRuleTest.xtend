package de.itemis.tooling.asp.parsing

import org.junit.Test

class BuiltinTest extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testBuiltin() {
		":- f<g.".noError
		":- f(Y)<g.".noError
		''':- f(1,h(2,"fdf",X,j(_,2*7+3)))<g.'''.noError
	}
}