
package de.itemis.tooling.asp;

/**
 * Initialization support for running Xtext languages 
 * without equinox extension registry
 */
public class AspStandaloneSetup extends AspStandaloneSetupGenerated{

	public static void doSetup() {
		new AspStandaloneSetup().createInjectorAndDoEMFRegistration();
	}
}

