#!/usr/bin/env python




##################################################
## DEPENDENCIES
import sys
import os
import os.path
try:
    import builtins as builtin
except ImportError:
    import __builtin__ as builtin
from os.path import getmtime, exists
import time
import types
from Cheetah.Version import MinCompatibleVersion as RequiredCheetahVersion
from Cheetah.Version import MinCompatibleVersionTuple as RequiredCheetahVersionTuple
from Cheetah.Template import Template
from Cheetah.DummyTransaction import *
from Cheetah.NameMapper import NotFound, valueForName, valueFromSearchList, valueFromFrameOrSearchList
from Cheetah.CacheRegion import CacheRegion
import Cheetah.Filters as Filters
import Cheetah.ErrorCatchers as ErrorCatchers

##################################################
## MODULE CONSTANTS
VFFSL=valueFromFrameOrSearchList
VFSL=valueFromSearchList
VFN=valueForName
currentTime=time.time
__CHEETAH_version__ = '2.4.4'
__CHEETAH_versionTuple__ = (2, 4, 4, 'development', 0)
__CHEETAH_genTime__ = 1365565333.362312
__CHEETAH_genTimestamp__ = 'Wed Apr 10 00:42:13 2013'
__CHEETAH_src__ = '../model/nameofprojectapp_cpp.tmpl'
__CHEETAH_srcLastModified__ = 'Wed Apr 10 00:29:50 2013'
__CHEETAH_docstring__ = 'Autogenerated by Cheetah: The Python-Powered Template Engine'

if __CHEETAH_versionTuple__ < RequiredCheetahVersionTuple:
    raise AssertionError(
      'This template was compiled with Cheetah version'
      ' %s. Templates compiled before version %s must be recompiled.'%(
         __CHEETAH_version__, RequiredCheetahVersion))

##################################################
## CLASSES

class nameofprojectapp_cpp(Template):

    ##################################################
    ## CHEETAH GENERATED METHODS


    def __init__(self, *args, **KWs):

        super(nameofprojectapp_cpp, self).__init__(*args, **KWs)
        if not self._CHEETAH__instanceInitialized:
            cheetahKWArgs = {}
            allowedKWs = 'searchList namespaces filter filtersLib errorCatcher'.split()
            for k,v in KWs.items():
                if k in allowedKWs: cheetahKWArgs[k] = v
            self._initCheetahInstance(**cheetahKWArgs)
        

    def respond(self, trans=None):



        ## CHEETAH: main method generated for this template
        if (not trans and not self._CHEETAH__isBuffering and not callable(self.transaction)):
            trans = self.transaction # is None unless self.awake() was called
        if not trans:
            trans = DummyTransaction()
            _dummyTrans = True
        else: _dummyTrans = False
        write = trans.response().write
        SL = self._CHEETAH__searchList
        _filter = self._CHEETAH__currentFilter
        
        ########################################
        ## START - generated method body
        
        write(u'''// For compilers that support precompilation, includes "wx/wx.h".
#include "wx/wxprec.h"

#ifndef WX_PRECOMP
#include "wx/wx.h"
#endif

////@begin includes
#include "wx/fs_zip.h"
////@end includes

#include "''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 12, col 12
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 12, col 12.
        write(u'''.h"

////@begin XPM images
////@end XPM images

/*
 * Application instance implementation
 */

////@begin implement app
IMPLEMENT_APP( ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 22, col 16
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 22, col 16.
        write(u''' )
////@end implement app

/*
 * ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 26, col 4
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 26, col 4.
        write(u''' type definition
 */

IMPLEMENT_CLASS( ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 29, col 18
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 29, col 18.
        write(u''', wxApp )

/*
 * ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 32, col 4
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 32, col 4.
        write(u''' event table definition
 */

BEGIN_EVENT_TABLE( ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 35, col 20
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 35, col 20.
        write(u''', wxApp )

////@begin ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 37, col 12
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 37, col 12.
        write(u''' event table entries
////@end ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 38, col 10
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 38, col 10.
        write(u''' event table entries

END_EVENT_TABLE()

/*
 * Constructor for ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 43, col 20
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 43, col 20.
        write(u'''
 */

''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 46, col 1
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 46, col 1.
        write(u'''::''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 46, col 16
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 46, col 16.
        write(u'''()
{
    Init();
}

/*
 * Member initialisation
 */

void ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 55, col 6
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 55, col 6.
        write(u'''::Init()
{
////@begin ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 57, col 12
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 57, col 12.
        write(u''' member initialisation
////@end ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 58, col 10
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 58, col 10.
        write(u''' member initialisation
}

/*
 * Initialisation for ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 62, col 23
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 62, col 23.
        write(u'''
 */

bool ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 65, col 6
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 65, col 6.
        write(u'''::OnInit()
{
////@begin ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 67, col 12
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 67, col 12.
        write(u''' initialisation
\t// Remove the comment markers above and below this block
\t// to make permanent changes to the code.

\t//wxXmlResource::Get()->InitAllHandlers();
\t//wxFileSystem::AddHandler(new wxZipFSHandler);
\t//wxXmlResource::Get()->Load(_T("my_wizard.xrc"));

#if wxUSE_XPM
\twxImage::AddHandler(new wxXPMHandler);
#endif
#if wxUSE_LIBPNG
\twxImage::AddHandler(new wxPNGHandler);
#endif
#if wxUSE_LIBJPEG
\twxImage::AddHandler(new wxJPEGHandler);
#endif
#if wxUSE_GIF
\twxImage::AddHandler(new wxGIFHandler);
#endif

\t//MyWizard* mainWindow = new MyWizard(NULL);
\t//mainWindow->Run();
\t//mainWindow->Destroy();
////@end ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 91, col 10
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 91, col 10.
        write(u''' initialisation

    return true;
}

/*
 * Cleanup for ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 97, col 16
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 97, col 16.
        write(u'''
 */

int ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 100, col 5
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 100, col 5.
        write(u'''::OnExit()
{
////@begin ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 102, col 12
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 102, col 12.
        write(u''' cleanup
\treturn wxApp::OnExit();
////@end ''')
        _v = VFFSL(SL,"class_name",True) # u'${class_name}' on line 104, col 10
        if _v is not None: write(_filter(_v, rawExpr=u'${class_name}')) # from line 104, col 10.
        write(u''' cleanup
}

''')
        
        ########################################
        ## END - generated method body
        
        return _dummyTrans and trans.response().getvalue() or ""
        
    ##################################################
    ## CHEETAH GENERATED ATTRIBUTES


    _CHEETAH__instanceInitialized = False

    _CHEETAH_version = __CHEETAH_version__

    _CHEETAH_versionTuple = __CHEETAH_versionTuple__

    _CHEETAH_genTime = __CHEETAH_genTime__

    _CHEETAH_genTimestamp = __CHEETAH_genTimestamp__

    _CHEETAH_src = __CHEETAH_src__

    _CHEETAH_srcLastModified = __CHEETAH_srcLastModified__

    _mainCheetahMethod_for_nameofprojectapp_cpp= 'respond'

## END CLASS DEFINITION

if not hasattr(nameofprojectapp_cpp, '_initCheetahAttributes'):
    templateAPIClass = getattr(nameofprojectapp_cpp, '_CHEETAH_templateClass', Template)
    templateAPIClass._addCheetahPlumbingCodeToClass(nameofprojectapp_cpp)


# CHEETAH was developed by Tavis Rudd and Mike Orr
# with code, advice and input from many other volunteers.
# For more information visit http://www.CheetahTemplate.org/

##################################################
## if run from command line:
if __name__ == '__main__':
    from Cheetah.TemplateCmdLineIface import CmdLineIface
    CmdLineIface(templateObj=nameofprojectapp_cpp()).run()


