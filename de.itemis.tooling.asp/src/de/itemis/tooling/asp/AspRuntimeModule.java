/*
 * generated by Xtext
 */
package de.itemis.tooling.asp;

import org.eclipse.xtext.resource.DerivedStateAwareResource;
import org.eclipse.xtext.resource.IDerivedStateComputer;
import org.eclipse.xtext.resource.ILocationInFileProvider;
import org.eclipse.xtext.resource.XtextResource;

import de.itemis.tooling.asp.resource.AspDerivedStateComputer;
import de.itemis.tooling.asp.resource.AspLocationInFileProvider;

/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
public class AspRuntimeModule extends de.itemis.tooling.asp.AbstractAspRuntimeModule {

	@Override
	public Class<? extends XtextResource> bindXtextResource() {
		return DerivedStateAwareResource.class;
	}

	public Class<? extends IDerivedStateComputer> bindderivedStateComputer() {
		return AspDerivedStateComputer.class;
	}


	public Class<? extends ILocationInFileProvider> bindLocationProvider() {
		return AspLocationInFileProvider.class;
	}

//	//currently not needed
//	public Class<? extends IDefaultResourceDescriptionStrategy> bindDescriptionStrategy() {
//		return AspResourceDescriptionStrategy.class;
//	}
}
