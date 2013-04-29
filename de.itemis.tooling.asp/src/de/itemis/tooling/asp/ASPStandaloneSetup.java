
package de.itemis.tooling.asp;

/**
 * Initialization support for running Xtext languages 
 * without equinox extension registry
 */
public class ASPStandaloneSetup extends ASPStandaloneSetupGenerated{

	public static void doSetup() {
		new ASPStandaloneSetup().createInjectorAndDoEMFRegistration();
	}
}

