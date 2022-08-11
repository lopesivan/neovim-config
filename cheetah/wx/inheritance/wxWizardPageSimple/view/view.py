# -*- coding: utf-8 -*-


# header
from MyWizardPageSimple_h import MyWizardPageSimple_h as h

# source
from MyWizardPageSimple_cpp import MyWizardPageSimple_cpp as cpp


class Header:
    def __init__(self, **nameSpace):
        self.header = h()
        self.header.class_name = nameSpace['class_name']
        self.header.class_name_upper = nameSpace['class_name'].upper()
        self.header.define_name = "_%s_H_" % nameSpace['class_name'].upper()
        self.header.class_id = nameSpace['class_id']

    def put(self):
        print self.header

    def save(self):
        fileName = "%s.h" % self.header.class_name
        open(fileName, 'w').write(str(self.header))


class Source:
    def __init__(self, **nameSpace):
        self.source = cpp()
        self.source.class_name = nameSpace['class_name']
        self.source.class_name_upper = nameSpace['class_name'].upper()

    def put(self):
        print self.source

    def save(self):
        fileName = "%s.cpp" % self.source.class_name
        open(fileName, 'w').write(str(self.source))


def main():
    nameSpace = {
        'class_name': 'MyWizardPageSimple',
        'class_id': '10000'
    }

    h = Header(**nameSpace)
    h.put()
    h.save()

    s = Source(**nameSpace)
    s.put()
    s.save()

if __name__ == "__main__":
    main()
