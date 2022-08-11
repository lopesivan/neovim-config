// For compilers that support precompilation, includes "wx/wx.h".
\#include "wx/wxprec.h"

\#ifndef WX_PRECOMP
\#include "wx/wx.h"
\#endif

////@begin includes
\#include "wx/fs_zip.h"
////@end includes

\#include "${class_name}.h"

////@begin XPM images
////@end XPM images

/*
 * Application instance implementation
 */

////@begin implement app
IMPLEMENT_APP( ${class_name} )
////@end implement app

/*
 * ${class_name} type definition
 */

IMPLEMENT_CLASS( ${class_name}, wxApp )

/*
 * ${class_name} event table definition
 */

BEGIN_EVENT_TABLE( ${class_name}, wxApp )

////@begin ${class_name} event table entries
////@end ${class_name} event table entries

END_EVENT_TABLE()

/*
 * Constructor for ${class_name}
 */

${class_name}::${class_name}()
{
    Init();
}

/*
 * Member initialisation
 */

void ${class_name}::Init()
{
////@begin ${class_name} member initialisation
////@end ${class_name} member initialisation
}

/*
 * Initialisation for ${class_name}
 */

bool ${class_name}::OnInit()
{
////@begin ${class_name} initialisation
	// Remove the comment markers above and below this block
	// to make permanent changes to the code.

	//wxXmlResource::Get()->InitAllHandlers();
	//wxFileSystem::AddHandler(new wxZipFSHandler);
	//wxXmlResource::Get()->Load(_T("my_wizard.xrc"));

\#if wxUSE_XPM
	wxImage::AddHandler(new wxXPMHandler);
\#endif
\#if wxUSE_LIBPNG
	wxImage::AddHandler(new wxPNGHandler);
\#endif
\#if wxUSE_LIBJPEG
	wxImage::AddHandler(new wxJPEGHandler);
\#endif
\#if wxUSE_GIF
	wxImage::AddHandler(new wxGIFHandler);
\#endif

	//MyWizard* mainWindow = new MyWizard(NULL);
	//mainWindow->Run();
	//mainWindow->Destroy();
////@end ${class_name} initialisation

    return true;
}

/*
 * Cleanup for ${class_name}
 */

int ${class_name}::OnExit()
{
////@begin ${class_name} cleanup
	return wxApp::OnExit();
////@end ${class_name} cleanup
}

