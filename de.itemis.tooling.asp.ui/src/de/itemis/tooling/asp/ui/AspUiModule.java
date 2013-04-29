/*
 * generated by Xtext
 */
package de.itemis.tooling.asp.ui;

import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.eclipse.xtext.ui.refactoring.IRenameStrategy;

import de.itemis.tooling.asp.ui.refactoring.AspRenameStrategy;

/**
 * Use this class to register components to be used within the IDE.
 */
public class AspUiModule extends de.itemis.tooling.asp.ui.AbstractAspUiModule {
	public AspUiModule(AbstractUIPlugin plugin) {
		super(plugin);
	}

//	public Class<? extends IRefactoringUpdateAcceptor> bindRefactoringAcceptor() {
//		return AspRefactoringAcceptor.class;
//	}
	
	@Override
	public Class<? extends IRenameStrategy> bindIRenameStrategy() {
		// TODO Auto-generated method stub
		return AspRenameStrategy.class;
	}
}
