package de.itemis.tooling.asp.resource

import de.itemis.tooling.asp.asp.AspFactory
import de.itemis.tooling.asp.asp.AspPackage$Literals
import de.itemis.tooling.asp.asp.Predicate
import de.itemis.tooling.asp.asp.PredicateRef
import de.itemis.tooling.asp.asp.VariableContainer
import de.itemis.tooling.asp.asp.VariableRef
import javax.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.xtext.nodemodel.util.NodeModelUtils
import org.eclipse.xtext.resource.DerivedStateAwareResource
import org.eclipse.xtext.resource.IDerivedStateComputer
import org.eclipse.xtext.parser.antlr.IReferableElementsUnloader$GenericUnloader

class AspDerivedStateComputer implements IDerivedStateComputer {

	@Inject 
	private GenericUnloader unloader;
	
	val AspFactory factory=AspFactory::eINSTANCE

	override discardDerivedState(DerivedStateAwareResource resource) {
		if(resource.contents!=null && resource.contents.size>0){
			(1..resource.contents.size)
			.forEach[
					unloader.unloadRoot(resource.contents.get(it)) 
					resource.contents.remove(it)
			]
			resource.contents.get(0).eContents.filter(typeof(VariableContainer)).forEach[variables.clear]
		}
	}

	//TODO optimize
	override installDerivedState(DerivedStateAwareResource resource, boolean preLinkingPhase) {
		if(resource.contents.size>0){
			resource.contents.get(0).eContents.forEach[addVariables]
			resource.contents.get(0).eAllContents.forEach[addPredicates(resource)]
		}
	}

	def dispatch void addPredicates(EObject o, DerivedStateAwareResource resource) { }

	def dispatch void addPredicates(PredicateRef o, DerivedStateAwareResource resource) {
		val newName=o.extractName(AspPackage$Literals::PREDICATE_REF__PREDICATE)
		val newArity=o.terms.size
		if(!resource.contents.tail.filter(typeof(Predicate)).exists[name==newName && arity==newArity]){
			resource.contents.add(factory.createPredicate=>[
				name=newName 
				arity=newArity
			])
		}
	}

	def dispatch void addVariables(EObject t){}

	def dispatch void addVariables(VariableContainer t){
		val allVariables=t.eAllContents.filter(typeof(VariableRef)).map[extractName(AspPackage$Literals::VARIABLE_REF__VALUE)].toSet
		allVariables.forEach[
			val theName=it
			t.variables.add(factory.createVariable=>[
				name=theName
			])
		]
	}

	def String extractName(EObject v, EStructuralFeature f){
		val nodes=NodeModelUtils::findNodesForFeature(v,f)
		nodes.head.text
	}
}