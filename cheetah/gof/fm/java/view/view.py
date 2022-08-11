# -*- coding: utf-8 -*-

# build_haml
from build_haml import build_haml as build


class mkBuild:
    def __init__(self, name):
        self.__file = build()
        self.__name = name

    def put(self):
        print self.__file

    def save(self):
        fileName = "%s.haml" % self.__name
        open(fileName, 'w').write(str(self.__file))


# Makefile
from Makefile import Makefile as makefile


class mkMakefile:
    def __init__(self, name):
        self.__file = makefile()
        self.__name = name

    def put(self):
        print self.__file

    def save(self):
        fileName = "%s" % self.__name
        open(fileName, 'w').write(str(self.__file))



# Client_java
from Client_java import Client_java as client


class mkClient:
    def __init__(self, **nameSpace):
        self.__file = client()
        self.__name  = nameSpace['Client']
        self.__file.Creator = nameSpace['Creator']
        self.__file.creator = nameSpace['Creator'].upper()
        self.__file.ConcreteCreator = nameSpace['ConcreteCreator']
        self.__file.anOperation = nameSpace['anOperation']

    def put(self):
        print self.__file

    def save(self):
        fileName = "%s.java" % self.__name
        open(fileName, 'w').write(str(self.__file))

# ConcreteCreator_java
from ConcreteCreator_java import ConcreteCreator_java as concreteCreator


class mkConcreteCreator:
    def __init__(self, **nameSpace):
        self.__file = concreteCreator()
        self.__name  = nameSpace['ConcreteCreator']
        self.__file.Creator = nameSpace['Creator']
        self.__file.Product = nameSpace['Product']
        self.__file.factoryMethod = nameSpace['factoryMethod']
        self.__file.ConcreteProduct = nameSpace['ConcreteProduct']

    def put(self):
        print self.__file

    def save(self):
        fileName = "%s.java" % self.__name
        open(fileName, 'w').write(str(self.__file))




# ProductA1_java
from Product_java import Product_java as product

class mkProduct:
    def __init__(self, **nameSpace):

        i = 0
        self.__files = []
        for index, name in enumerate(nameSpace['Product']):
            self.__files.append(product())
            self.__files[index].Product = name

            self.__files[index].AbstractProduct = nameSpace['AbstractProduct'][i]
            i = i + 1

            if i == len(nameSpace['AbstractProduct']):
                i = 0


    def put(self):
        for f in self.__files:
            print f

    def save(self):
        for f in self.__files:
            fileName = "%s.java" % f.Product
            open(fileName, 'w').write(str(f))



def main():
    makefile = mkMakefile("Makefile")
    #makefile.put()
    makefile.save()

    build = mkBuild("build")
    #build.put()
    build.save()



    nameSpace = {
        'Client': 'Client',
        'ConcreteCreator': 'ConcreteCreator',
        'factoryMethod': 'factoryMethod',
        'ConcreteProduct': 'ConcreteProduct',
        'Creator': 'Creator',
        'anOperation': 'anOperation',
        'Product': 'Product',
        'doIt': 'doIt'
    }

    nameSpacee = {
        'Client': 'Client',
        'ConcreteCreator': 'ConcreteCreator',
        'factoryMethod': 'factoryMethod',
        'ConcreteProduct': 'ConcreteProduct',
        'Creator': 'Creator',
        'anOperation': 'anOperation',
        'Product': 'Product',
        'doIt': 'doIt'
    }

    d = nameSpace
    d = nameSpacee

    c = mkClient(**d)
    #c.put()
    c.save()

    cc = mkConcreteCreator(**d)
    #cc.put()
    cc.save()

    #p = mkProduct(**d)
    #p.put()
    #p.save()


if __name__ == "__main__":
    main()

