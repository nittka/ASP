package de.itemis.tooling.asp.resource;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.resource.EObjectDescription;
import org.eclipse.xtext.resource.IEObjectDescription;
import org.eclipse.xtext.resource.impl.DefaultResourceDescriptionStrategy;
import org.eclipse.xtext.util.IAcceptor;

import com.google.common.collect.ImmutableMap;

import de.itemis.tooling.asp.asp.Predicate;

//currently not needed as we do not consider cross file references yet
public class AspResourceDescriptionStrategy extends
		DefaultResourceDescriptionStrategy {

	
	@Override
	public boolean createEObjectDescriptions(EObject eObject,
			IAcceptor<IEObjectDescription> acceptor) {
		if(eObject instanceof Predicate){
			Predicate p = (Predicate) eObject;
			acceptor.accept(EObjectDescription.create(p.getName(), eObject, ImmutableMap.of("arity",""+p.getArity())));
			return false;
		}else{
			return super.createEObjectDescriptions(eObject, acceptor);
		}
	}
}
