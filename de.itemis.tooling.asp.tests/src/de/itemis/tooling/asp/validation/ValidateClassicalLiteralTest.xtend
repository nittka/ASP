package de.itemis.tooling.asp.validation

import de.itemis.tooling.asp.AspTest
import de.itemis.tooling.asp.aSP.ASPPackage$Literals
import org.junit.Test

/**
 * proof of concept tests that wherever only classical literals are allowed
 * we raise an error, if the term there does not have the correct form
 */
class ValidateClassicalLiteralTest extends AspTest {

	@Test
	def void testHeadOK() {
		"p.".noError
		"p:-.".noError
		"p(X)|q(2*f(Y),-z):-.".noError
		"p|q|r:-.".noError
		"{p;q;r}:-.".noError
		"-p.".noError
		"-p:-.".noError
		"-p|-q:-.".noError
		"p|-q|-r:-.".noError
		"{p;-q;-r}:-.".noError
	}

	@Test
	def void testSimpleHeadErrors() {
		val typeWithError=ASPPackage$Literals::RULE
		"X:-.".parsed.error(typeWithError,"head")
		'''"tada":-.'''.parsed.error(typeWithError,"head")
	}

	@Test
	def void testDisjunctionHeadErrors() {
		val typeWithError=ASPPackage$Literals::DISJUNCTION
		"p|X:-.".parsed.error(typeWithError,"disjunction")
		
	}

	@Test
	def void testChoiceHeadErrors() {
		val typeWithError=ASPPackage$Literals::CHOICE_ELEMENT
		"{-p;X;r}:-.".parsed.error(typeWithError, "choice element")
		
	}
}
