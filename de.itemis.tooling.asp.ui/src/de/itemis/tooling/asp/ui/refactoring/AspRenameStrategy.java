package de.itemis.tooling.asp.ui.refactoring;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.ui.refactoring.IRefactoringUpdateAcceptor;
import org.eclipse.xtext.ui.refactoring.impl.DefaultRenameStrategy;
import org.eclipse.xtext.ui.refactoring.ui.IRenameElementContext;

public class AspRenameStrategy extends DefaultRenameStrategy {

	boolean doRename=true;

	@Override
	public boolean initialize(EObject targetElement,
			IRenameElementContext context) {
		//TODO evaluate targetElementClass
		//the link target is always "virtual"
		doRename=false;
		return super.initialize(targetElement, context);
	}
	@Override
	public void createDeclarationUpdates(String newName,
			ResourceSet resourceSet, IRefactoringUpdateAcceptor updateAcceptor) {
		if(doRename){
			super.createDeclarationUpdates(newName, resourceSet, updateAcceptor);
		}
	}
}
