package de.itemis.tooling.asp.parsing

import com.google.inject.Inject
import de.itemis.tooling.asp.ASPInjectorProvider
import de.itemis.tooling.asp.aSP.Program
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ASPInjectorProvider))
abstract class AbstractAspTest {

	@Inject extension ParseHelper<Program>
	@Inject extension ValidationTestHelper

//		val builder=SaveOptions::newBuilder
//		builder.format
//		model.eResource.save(System::out,builder.options.toOptionsMap)
//TODO tests rausziehen

	

	def noError(CharSequence model){
		val semantic=model.parse
//		semantic.eAllContents.forEach[println(it)]
		//possibleLogging
		semantic.assertNoIssues
		semantic
	}
}
