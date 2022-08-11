public abstract class Creator {
	public void anOperation()
	{
		Product product = factoryMethod();
		product.desenhar();
	}

	protected abstract Product factoryMethod();
}
