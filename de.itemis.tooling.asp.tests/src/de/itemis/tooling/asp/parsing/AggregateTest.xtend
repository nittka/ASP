package de.itemis.tooling.asp.parsing

import de.itemis.tooling.asp.aSP.ASPPackage$Literals
import de.itemis.tooling.asp.aSP.Aggregate
import de.itemis.tooling.asp.aSP.Rule
import de.itemis.tooling.asp.aSP.Statement
import org.junit.Assert
import org.junit.Test

class AggregateTest extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testAggregates(){
		'''
			:-#sum{}.
			:-#min{}.
			:-#max{}.
			:-#count{}.
			:-3<#count{}.
			:-#count{}!=p.
			:-4<>#sum{p:not 3<7}<=f(X).
		'''.noError.statements.forEach[assertIsAggregate]
	}

	/**we assume single body element*/
	def private Aggregate assertIsAggregate(Statement s){
		val bodyelement=(s as Rule).body.elements.get(0).positive
		
		Assert::assertTrue(bodyelement.eClass==ASPPackage$Literals::AGGREGATE)
		return bodyelement as Aggregate
	}
}