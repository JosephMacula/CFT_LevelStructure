#An example of a ray class field and its subfield structure as an extension of a Hilbert class field

#construct K = Q(sqrt(-5))

x = polygens(QQ, 'x')
R.<x> = PolynomialRing(QQ)
f = x^2 + 5
K.<y> = NumberField(f)

#construct the Hilbert class field of K

hilbert_polynomial = K.hilbert_class_polynomial()
HCF.<z> = K.extension(hilbert_polynomial)

#construct the ray class field with modulus 6 by finding a root of the Hilbert
#class polynomial, computing its division polynomial, finding the largest factor,
#and computing the splitting field of this polynomial

hilbert_polynomial = hilbert_polynomial.change_ring(HCF)
chosen_j_invariant = hilbert_polynomial.roots()[1][0]
E=EllipticCurve(j=HCF(chosen_j_invariant))
sixdivpoly = E.division_polynomial(6)
RCF.<a> = HCF.extension(sixdivpoly.factor()[-1][0])


def HCF_and_RCFconstructor(a, b):
	x = polygens(QQ, 'x')
	R.<x> = PolynomialRing(QQ)
	f = x^2 + a
	K.<y> = NumberField(f)
	hilbert_polynomial = K.hilbert_class_polynomial()
	HCF.<z> = K.extension(hilbert_polynomial)
	hilbert_polynomial = hilbert_polynomial.change_ring(HCF)
	chosen_j_invariant = hilbert_polynomial.roots()[-1][0]
	E=EllipticCurve(j=HCF(chosen_j_invariant))
	divpoly = E.division_polynomial(b)
	RCF.<a> = HCF.extension(divpoly.factor()[-1][0])
	return(HCF, RCF)


def HCF_to_RCF_fields(RCF, HCF):
	G = RCF.galois_group()
	subfields_of_RCF = []
	for i in G.subgroups():
		subfields_of_RCF.append(i.fixed_field()[0])
	HCF_to_RCF_intermediate_fields = []
	HCF_absolute.<a> = HCF.absolute_field()
	HCF_polynomial = HCF_absolute.defining_polynomial()
	for i in subfields_of_RCF:
		if len(HCF_polynomial.change_ring(i).factor()) == HCF_polynomial.degree():
			HCF_to_RCF_intermediate_fields.append(i)
	return HCF_to_RCF_intermediate_fields
