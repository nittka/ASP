package de.itemis.tooling.asp.validation;

import org.eclipse.xtext.validation.ComposedChecks;
 

@ComposedChecks(validators={ClassicalLiteralValidator.class})
public class ASPJavaValidator extends AbstractASPJavaValidator {

//	@Check
//	public void checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.getName().charAt(0))) {
//			warning("Name should start with a capital", MyDslPackage.Literals.GREETING__NAME);
//		}
//	}

}
