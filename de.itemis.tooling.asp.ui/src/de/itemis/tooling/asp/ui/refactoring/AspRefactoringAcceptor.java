package de.itemis.tooling.asp.ui.refactoring;

import javax.inject.Inject;

import org.eclipse.xtext.ui.refactoring.impl.IRefactoringDocument.Provider;
import org.eclipse.xtext.ui.refactoring.impl.RefactoringUpdateAcceptor;

//momentan überflüssing
public class AspRefactoringAcceptor extends RefactoringUpdateAcceptor {
//
//	private boolean first;
//
	@Inject
	public AspRefactoringAcceptor(Provider refactoringDocumentProvider) {
		super(refactoringDocumentProvider);
//		first=false;
	}
//	@Override
//	public void accept(URI resourceURI, TextEdit textEdit) {
//		if(!first){
//			first=true;
//		}else{
//			super.accept(resourceURI, textEdit);
//		}
//	}
//	@Override
//	public void accept(URI resourceURI, Change change) {
//		if(!first){
//			first=true;
//		}else{
//			super.accept(resourceURI, change);
//		}
//	}
}
