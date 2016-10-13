// n < 7 (explota)
int n = 6;
// Vector de primos con los n primeros.
int[] primos = new int [n];
int[] prC = new int [n];
int M;
int [] vec = new int [2*n];
int [] coef = new int [n];

void setup() {
  primos = HallaPrimos (n);
  for (int i = 0; i < n; i++)
    prC [i] = primos [i]*primos [i];
  //int [] vec = new int [2*n];
  for (int i = 0; i < n; i++) {
    vec [2*i] = -(i+1);
    vec [2*i+1] = prC [i];
  }
  M = tcrA (vec)[0];
  int N = tcrA (vec)[1];
  if (M < 0) {
    while (M < 0) {
      M += N;
    }
  } else {
    M = M%N;
  }
  for (int i = 0; i < n; i++)
    coef [i] = (M+i+1)/prC [i];
  background (0);
}

void draw() {
  fill (240);
  textSize (55);
  for (int i = 0; i < n+1; i++) {
    //text (str (vec [i]), 200, 200+150*i);
    text ("M + " + str (i) + ":" + "   " + str (M+i), 200, 200+150*i);
    if (i>0) text (str (coef[i-1]) + " × " + str (prC [i-1]), 900, 200+150*i);
  }
  noLoop ();
}

// Halla los n primeros primos.
int [] HallaPrimos (int n) {
  int[] sal = new int [n];
  int ind = 0;
  int i = 2;
  int ndiv = 0;
  while (ind < n) {
    for (int j = 1; j < i; j++) {
      if (i%j == 0) ndiv++;
    }
    if (ndiv == 1) {
      sal [ind] = i;
      ind++;
    }
    i++;
    ndiv = 0;
  }
  return sal;
}

int[] bez (int b1, int b2) {
  int c;
  int f11;
  int f12;
  int f21;
  int f22;
  int f31;
  int f32;
  int i;
  int[] sal = new int [2];
  if (b1%b2 == 0 || b2%b1 == 0) {
    // b1 y b2 no son coprimos.
  } else {
    IntList f1 = new IntList ();
    IntList f2 = new IntList ();
    IntList f3 = new IntList ();
    f1.append (b1);
    f1.append (b2);
    f2.append (1);
    f2.append (0);
    f3.append (0);
    f3.append (1);
    i = 0;
    while (f1.get (i+1) != 1) {
      f11 = f1.get (i);
      f12 = f1.get (i+1);
      f21 = f2.get (i);
      f22 = f2.get (i+1);
      f31 = f3.get (i);
      f32 = f3.get (i+1);
      if (f11 < f12) {
        c = floor (f12/f11);
        f1.append (f12-c*f11);
        f2.append (f22-c*f21);
        f3.append (f32-c*f31);
      } else {
        c = floor (f11/f12);
        f1.append (f11-c*f12);
        f2.append (f21-c*f22);
        f3.append (f31-c*f32);
      }
      i++;
    }
    sal [0] = f2.get (i+1);
    sal [1] = f3.get (i+1);
  }
  return sal;
}

int[] tcrA (int [] a) {
  int[] sal = new int [2];
  if (a.length % 2 == 1) {
    // mal vector de entrada.
  } else {
    // Comprueba si todos son coprimos.
    int l = a.length;
    int n = 0;
    for (int i = 0; i < l/2 - 1; i++) {
      if (a [2*i+1] % a [2*i+3] == 0) n++;
    }
    if (n > 0) {
      // No todos coprimos.
    } else {
      n = 1;
      for (int i = 0; i < l/2; i++) 
        n *= a [2*i+1];
      int [] m = new int [l/2];
      int [] s = new int [l/2];
      for (int i = 0; i < l/2; i++) {
        m [i] = n / a [2*i+1];
        s [i] = bez (m [i], a [2*i+1])[0];
        sal [0] += m [i] * s [i] * a [2*i];
      }
      // mcm. En este caso, así.
      sal [1] = n;
    }
  }
  return sal;
}