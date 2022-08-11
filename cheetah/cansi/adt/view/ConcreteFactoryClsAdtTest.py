from ClsAdtTest import ClsAdtTest


class ConcreteFactoryClsAdtTest:
    def get_ball(self, dataModel):
        return ClsAdtTest(dataModel)
