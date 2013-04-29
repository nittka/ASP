package de.itemis.tooling.asp.resource

import de.itemis.tooling.asp.asp.Predicate
import de.itemis.tooling.asp.asp.Variable
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.EcoreUtil$UsageCrossReferencer
import org.eclipse.xtext.resource.DefaultLocationInFileProvider
import org.eclipse.xtext.util.TextRegion

class AspLocationInFileProvider extends DefaultLocationInFileProvider {

	override getSignificantTextRegion(EObject obj) {
		//TODO find first "usage", für predicate verbessern
		switch obj{
			Predicate:super.getSignificantTextRegion(obj.firstUsage)
			Variable:super.getSignificantTextRegion(obj.firstUsage)
			default:super.getSignificantTextRegion(obj)
		}
	}

	def firstUsage(EObject o){
		return EcoreUtil$UsageCrossReferencer::find(o,o.eResource).head.EObject
	}
}
