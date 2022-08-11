input metauml;

beginfig(1);
    Class.factory("AbstractFactory")()
                 ("+CreateProductA()", "+CreateProductB()");
    classStereotypes.factory("<<interface>>");

    Class.concreteA("ConcreteFactory1")()
                   ("+CreateProductA()", "+CreateProductB()");
    Class.concreteB("ConcreteFactory2")()
                   ("+CreateProductA()", "+CreateProductB()");

    Class.client("Client")()();
    Class.abstractA("AbstractProductA")()();
    Class.productAa("ProductA1")()();
    Class.productAb("ProductA2")()();
    Class.abstractB("AbstractProductB")()();
    Class.productBa("ProductB1")()();
    Class.productBb("ProductB2")()();

    client.w = factory.e + (200,0);
    centered_allign_top(concreteA, concreteB)(30, below(factory.s, 50)  );
    centered_allign_top(abstractA, abstractB)(40, below(client.s, 40)   );
    centered_allign_top(productAa, productAb)(5,  below(abstractA.s, 30));
    centered_allign_top(productBa, productBb)(5,  below(abstractB.s, 30));

    drawObjects(factory, concreteA, concreteB, client, abstractA, abstractB, productAa, productAb, productBa, productBb);

    clink(associationUni)(client, factory);
    link(inheritance)(pathStepY(concreteA.n, factory.s, 20));
    link(inheritance)(pathStepY(concreteB.n, factory.s, 20));
    clink(associationUni)(client, abstractA);
    clink(associationUni)(client, abstractB);
    link(inheritance)(pathStepY(productAa.n, abstractA.s, 10));
    link(inheritance)(pathStepY(productAb.n, abstractA.s, 10));
    link(inheritance)(pathStepY(productBa.n, abstractB.s, 10));
    link(inheritance)(pathStepY(productBb.n, abstractB.s, 10));

    link(associationUni)(pathStepY(concreteA.s - (5,0), productAa.s, -60));
    link(associationUni)(pathStepY(concreteA.s + (5,0), productBa.s, -70));

    link(associationUni)(pathStepY(concreteB.s - (5,0), productAb.s, -30));
    link(associationUni)(pathStepY(concreteB.s + (5,0), productBb.s, -40));
endfig;

end
