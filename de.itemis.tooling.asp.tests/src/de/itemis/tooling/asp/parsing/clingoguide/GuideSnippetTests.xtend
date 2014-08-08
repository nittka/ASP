package de.itemis.tooling.asp.parsing.clingoguide

import org.junit.Test
import de.itemis.tooling.asp.parsing.AbstractAspTest

/**
 * these snippets were taken from the clingo_guide.pdf
 * version 3.x, October 4,2010
 */
class GuideSnippetTests extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testBuiltin() {
		":- f<g.".noError
		":- f(Y)<g.".noError
		''':- f(1,h(2,"fdf",X,j(_,2*7+3)))<g.'''.noError
	}
}