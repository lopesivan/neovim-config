# AdtTest_c
from C.adt.AdtTest_c import AdtTest_c
from TemplateInterface import TemplateInterface


class ClsAdtTest(TemplateInterface):
    def __init__(self, dataModel):
        self.__file = AdtTest_c()

        adtsource = dataModel['AdtSource']

        self.__file.AdtSource = adtsource[0]
        self.__file.adtsource = adtsource[0].lower()
        self.__file.AdtTest = "Test%s" % adtsource[0]
        self.__file.adttest = "Test%s" % adtsource[0].lower()

        struct_body = adtsource[1].keys()[0]
        self.__file.struct_body = adtsource[1][struct_body]

        adtheader = dataModel['AdtHeader']

        self.__file.AdtHeader = adtheader[0]
        self.__file.adtheader = adtheader[0].lower()

        header_name_without_h = adtheader[0].split('.')[0]

        self.__file.header_name_without_h_uppercase = \
            header_name_without_h.upper()

        self.__file.struct_name = \
            header_name_without_h.title()

        Arguments = adtheader[1].keys()[0]
        self.__file.Arguments = ", ".join(adtheader[1][Arguments])


    def put(self):
        fileName = "%s" % self.__file.AdtTest
        print "File: %s" % fileName
        print self.__file

    def save(self):
        fileName = "%s" % self.__file.AdtTest
        open(fileName, 'w').write(str(self.__file))
