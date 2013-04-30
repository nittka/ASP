package de.itemis.tooling.asp

import de.itemis.tooling.asp.aSP.Program
import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.runner.RunWith
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EClass

/**
 * convenience class for tests
 */
@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ASPInjectorProvider))
abstract class AspTest {
	
	@Inject extension ParseHelper<Program>
	@Inject extension ValidationTestHelper

	def noError(CharSequence model){
		val semantic=model.parsed
		semantic.assertNoIssues
		semantic
	}

	def parsed(CharSequence model){
		val semantic=model.parse
		//possibleLogging
//		println(model)
//		println(semantic)
//		semantic.eAllContents.forEach[println(it)]
//		println("\n")
		semantic
		
	}

	def error(EObject semantic, EClass type,String sub){
		assertError(semantic,type,null,sub,"classical literal"
		)
	}


}