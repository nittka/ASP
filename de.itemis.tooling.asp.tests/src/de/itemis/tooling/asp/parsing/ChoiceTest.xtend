package de.itemis.tooling.asp.parsing

import de.itemis.tooling.asp.parsing.AbstractAspTest
import org.junit.Test
import de.itemis.tooling.asp.aSP.Rule
import de.itemis.tooling.asp.aSP.Choice
import de.itemis.tooling.asp.aSP.Statement
import org.junit.Assert
import de.itemis.tooling.asp.aSP.ASPPackage

class ChoiceTest extends AbstractAspTest {

	@Test
	def void testEmptyChoice(){
		val choice="{}:-.".noError.statements.get(0).assertIsChoice
		Assert::assertNull(choice.leftTerm)
		//TODO enums have a default value if unset
//		Assert::assertNull(choice.leftBinop)
		Assert::assertNull(choice.rightTerm)
//		Assert::assertNull(choice.rightBinop)
		Assert::assertEquals(0,choice.elements.size)
	}

	//TODO not only simple parsing tests
	//TODO more cases
	@Test
	def void testChoices(){
		'''
			{}:-.
			1<{}:-.
			{}<3:-.
			1!={}<=3:-.
			p(X)!={}<=3:-.
			{p}:-.
			{p;q}:-.
			{p;q;r}:-.
			{p:not q;r: s, not t}:-.
		'''.noError.statements.forEach[assertIsChoice]
	}

	def private Choice assertIsChoice(Statement s){
		val head=(s as Rule).head
		Assert::assertTrue(head.eClass==ASPPackage$Literals::CHOICE)
		return head as Choice
	}
}