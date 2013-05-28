package de.itemis.tooling.asp.parsing

import org.junit.Test

class OptimizeTest extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testOptimizeStructure(){
		"#maximize{}.".noError
		"#maximise{}.".noError
		"#minimize{}.".noError
		"#minimise{}.".noError

		"#maximize{3}.".noError
		"#maximize{3;4;5}.".noError
		"#maximize{3@p:not q,not X<Y;4@q:-q(X)}.".noError
	}
}