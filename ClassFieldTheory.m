//_<x> := PolynomialRing(Rationals());
//K := NumberField(x^2 + 5);
//OK := MaximalOrder(K);
//I := ideal< OK | [6]>;
//R:= RayClassField(I);
//R;


// Define the base field K = Q(sqrt(-5))
K<sqrtm5> := AbsoluteField(QuadraticField(-5));
OK := Integers(K);

// Define the modulus m = (6)
modulus := ideal< OK | 6 >;

// Compute the ray class group modulo (6)
RCG, mp := RayClassGroup(modulus);

// Construct the ray class field
rayClassField := RayClassField(mp);
rayClassField := AbsoluteField(NumberField(rayClassField));

// Output info about the field
printf "Ray class field has degree %o over K\n", Degree(rayClassField);

// List all intermediate fields between K and the ray class field
intermediates := Subfields(rayClassField);
printf "Intermediate fields:\n";
for pair in intermediates do
    L := pair[1];
	if IsSubfield(K, L) then
        printf "Degree %o extension over Q\n", Degree(L);
        printf "Defining polynomial: %o\n\n", DefiningPolynomial(L);
    end if;
end for;