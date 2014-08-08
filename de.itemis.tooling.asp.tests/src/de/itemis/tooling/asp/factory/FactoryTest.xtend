package de.itemis.tooling.asp.factory

import com.google.inject.Inject
import de.itemis.tooling.asp.ASPInjectorProvider
import de.itemis.tooling.asp.aSP.ASPFactory
import de.itemis.tooling.asp.aSP.Program
import de.itemis.tooling.asp.aSP.Rule
import de.itemis.tooling.asp.aSP.Term
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.resource.IResourceFactory
import org.eclipse.xtext.resource.SaveOptions
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ASPInjectorProvider))
/**
 * proof of concept for manually instantiating and serialising programs
 * it will make sense to implement an extended factory, providing convenience methods
 * as illustrated in this test
 */
class FactoryTest {

	@Inject
	private IResourceFactory resourceFactory;
	extension ASPFactory fac=ASPFactory::eINSTANCE

	@Test
	def void testSimpleProgram() {
		val prog=createProgram;
		val r=createRule=>[
			head=fct("p")
			addBody(fct("q"),false)
			addBody(fct("r"),true)
		]
		prog.statements.add(r)
		prog.serialize
	}


	def addBody(Rule p, Term t, boolean defNegated){
		val el=createBodyElement=>[
			defaultNegated=defNegated
			positive=t
		]
		if(p.body==null){
			p.body=createBody
		}
		p.body.elements.add(el)
	}

	def fct(String fctName){
		createFunction=>[
			name=fctName
		]
	}

	def void serialize(Program p){
		resourceFactory.createResource(URI::createURI("bla.lp")).contents.add(p)
		val builder=SaveOptions::newBuilder
		builder.format
		p.eResource.save(System::out,builder.options.toOptionsMap)
	}
}
