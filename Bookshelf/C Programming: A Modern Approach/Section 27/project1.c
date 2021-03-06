#include <stdio.h>
#include <complex.h>

int main(void)
{
	double a, b, c;
	double complex discriminant_sqrt;
	double complex root1;
	double complex root2;
	
	printf("Enter coefficients of polynomial (a b c): ");
	scanf("%lf %lf %lf", &a, &b, &c);
	
	discriminant_sqrt = csqrt(b * b - 4 * a * c);
	root1 = (-b + discriminant_sqrt) / (2 * a);
	root2 = (-b - discriminant_sqrt) / (2 * a);
	
	if (cimag(discriminant_sqrt) != 0)
	{
		printf("root1 = %g + %gi\n", creal(root1), cimag(root1));
		printf("root2 = %g + %gi\n", creal(root2), cimag(root2));
	}
	else
	{
		printf("root1 = %g\n", creal(root1));
		printf("root2 = %g\n", creal(root2));
	}

	return 0;
}