package de.itemis.tooling.asp.parsing

import org.junit.Test

class WRuleTest extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testWRuleStructure(){
		":~p.[3]".noError
		":~p.[f(g(X))@p]".noError
		":~p.[3,f(X)]".noError
		":~p.[Y,f(X)]".noError
	}
}