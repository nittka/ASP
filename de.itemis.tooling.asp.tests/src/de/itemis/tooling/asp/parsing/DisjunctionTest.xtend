package de.itemis.tooling.asp.parsing

import de.itemis.tooling.asp.aSP.ASPPackage$Literals
import de.itemis.tooling.asp.aSP.Disjunction
import de.itemis.tooling.asp.aSP.Rule
import de.itemis.tooling.asp.aSP.Statement
import org.junit.Assert
import org.junit.Test

class DisjunctionTest extends AbstractAspTest {

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testDisjunctions(){
		'''
			a:-.
			a|b:-.
			a|b|c:-.
		'''.noError.statements.forEach[assertIsDisjunction]
	}

	def private Disjunction assertIsDisjunction(Statement s){
		val head=(s as Rule).head
		Assert::assertTrue(head.eClass==ASPPackage$Literals::DISJUNCTION)
		return head as Disjunction
	}
}