/*
 * generated by Xtext
 */
package de.itemis.tooling.asp.scoping;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.xtext.scoping.IScope;
import org.eclipse.xtext.scoping.Scopes;
import org.eclipse.xtext.scoping.impl.AbstractDeclarativeScopeProvider;

import de.itemis.tooling.asp.asp.Predicate;
import de.itemis.tooling.asp.asp.PredicateRef;
import de.itemis.tooling.asp.asp.VariableContainer;

/**
 * This class contains custom scoping description.
 * 
 * see : http://www.eclipse.org/Xtext/documentation/latest/xtext.html#scoping
 * on how and when to use it 
 *
 */
public class AspScopeProvider extends AbstractDeclarativeScopeProvider {

	IScope scope_Variable(VariableContainer c, EReference ref){
		return Scopes.scopeFor(c.getVariables());
	}

	IScope scope_Predicate(PredicateRef o, EReference ref){
		List<EObject>os=new ArrayList<EObject>();
		for (EObject ob : o.eResource().getContents()) {
			if(ob instanceof Predicate){
				Predicate p = (Predicate)ob;
				if(p.getArity()==o.getTerms().size()){
					os.add(p);
				}
			}
		}
		return Scopes.scopeFor(os);

		//TODO use index?, override ImportedNamespaceAware internalElementsScope
//		final String arity=""+o.getTerms().size();
//		return new FilteringScope(delegateGetScope(o, ref), new Predicate<IEObjectDescription>(){
//			public boolean apply(IEObjectDescription desc){
//				return arity.equals(desc.getUserData("arity"));
//			}
//		});
	}
}
