import yaml
from AbstractFactory import AbstractFactory


if __name__ == "__main__":

    config_file = file('adt.yaml', 'r')
    dataModel = yaml.load(config_file)
    config_file.close()

    #
    # arquivo 1
    #
    factory = AbstractFactory.get_factory('AdtHeader')
    f = factory.get_ball(dataModel)
    f.put()
    #
    # arquivo 2
    #
    factory = AbstractFactory.get_factory('AdtSource')
    f = factory.get_ball(dataModel)
    f.put()
    #
    # arquivo 3
    #
    factory = AbstractFactory.get_factory('AdtTest')
    f = factory.get_ball(dataModel)
    f.put()



