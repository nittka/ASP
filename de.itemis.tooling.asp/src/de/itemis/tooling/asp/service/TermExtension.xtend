package de.itemis.tooling.asp.service

import de.itemis.tooling.asp.aSP.ASPPackage$Literals
import de.itemis.tooling.asp.aSP.Function
import de.itemis.tooling.asp.aSP.NegatedTerm
import de.itemis.tooling.asp.aSP.Term
import javax.inject.Singleton
import org.eclipse.emf.ecore.EObject

@Singleton
/** 
 * in order to get the grammar backtracking free, we cannot distinguish between functions and literals
 * this extension allows to check whether a term would be a valid literal
 * and whether a function actually is a literal
 * NOTE: THIS IS PROOF OF CONCEPT
 * 
 * this extension can later be used for validation and scoping
 * */
class TermExtension {

	def boolean isLiteral(Function f){
		f.hasLiteralContainer(true)
	}

	def private boolean hasLiteralContainer(EObject f, boolean allowNegation){
		switch f.eContainingFeature{
			case ASPPackage$Literals::RULE__HEAD:true
			case ASPPackage$Literals::BODY_ELEMENT__POSITIVE:true
			case ASPPackage$Literals::DISJUNCTION__LITERAL:true
			case ASPPackage$Literals::CHOICE_ELEMENT__HEAD:true
			case ASPPackage$Literals::NAF_LITERAL__POSITIVE:true
			case ASPPackage$Literals::NEGATED_TERM__NEGATED:f.eContainer.hasLiteralContainer(false)
			default: false
		}
	}

	def boolean isValidClassicalLiteral(Term t){
		switch t{
			Function:true
			NegatedTerm: t.negated.isFunction
			default: false
		}
	}

	def private dispatch isFunction(EObject f){false}
	def private dispatch isFunction(Function f){true}
}