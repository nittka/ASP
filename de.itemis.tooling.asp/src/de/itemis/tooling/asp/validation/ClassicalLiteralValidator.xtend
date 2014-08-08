package de.itemis.tooling.asp.validation

import org.eclipse.xtext.validation.AbstractDeclarativeValidator
import org.eclipse.xtext.validation.Check
import de.itemis.tooling.asp.aSP.Rule
import de.itemis.tooling.asp.aSP.Term
import de.itemis.tooling.asp.service.TermExtension
import javax.inject.Inject
import de.itemis.tooling.asp.aSP.Disjunction
import de.itemis.tooling.asp.aSP.Choice
import de.itemis.tooling.asp.aSP.ASPPackage
import org.eclipse.xtext.validation.EValidatorRegistrar

//TODO extend to all structures where the grammar allows a term
//and semantically only a classical literal is possible
class ClassicalLiteralValidator extends AbstractDeclarativeValidator {

	@Inject
	extension TermExtension  e

	override register(EValidatorRegistrar registrar) {}

	@Check
	def checkHead(Rule r){
		if(r.head!=null){
			internalCheckHead(r.head, r)
		}
	}

	def private dispatch internalCheckHead(Term t,Rule r){
		if(!t.validClassicalLiteral){
			error("head may only be a classical literal", r, ASPPackage$Literals::RULE__HEAD,-1)
		}
	}

	def private dispatch internalCheckHead(Disjunction j,Rule r){
		val errorLiterals= j.literals.filter[!validClassicalLiteral]
		errorLiterals.forEach[
			error("disjunction literal may only be a classical literal", j,ASPPackage$Literals::DISJUNCTION__LITERALS,j.literals.indexOf(it))
		]
	}

	def private dispatch internalCheckHead(Choice c,Rule r){
		val errorLiterals= c.elements.filter[!head.validClassicalLiteral]
		errorLiterals.forEach[
			error("head of choice element may only be a classical literal", it,ASPPackage$Literals::CHOICE_ELEMENT__HEAD,-1)
		]
	}
}