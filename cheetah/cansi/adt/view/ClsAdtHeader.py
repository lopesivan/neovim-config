# AdtHeader_h
from C.adt.AdtHeader_h import AdtHeader_h
from TemplateInterface import TemplateInterface


class ClsAdtHeader(TemplateInterface):
    def __init__(self, dataModel):
        self.__file = AdtHeader_h()

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
        fileName = "%s" % self.__file.AdtHeader
        print "File: %s" % fileName
        print self.__file

    def save(self):
        fileName = "%s" % self.__file.AdtHeader
        open(fileName, 'w').write(str(self.__file))
