// Desechado. La idea era "enlazar" los
// resultados de varias identidades de 
// Bèzout entre primos cuadrados para que
// quedaran consecutivos. No es necesario 
// tanto lío.

// n >= 3
/*
int n = 7;
// Vector de primos con los n primeros.
int[] primos = new int [n];
int[] prC = new int [n];
// Coeficientes de las filas.
// cf1: positivos los impares, negativos los pares.
int[][] cf1 = new int [n][2];
// cf2: positivos los impares, negativos los pares.
int[][] cf2 = new int [n][2];
// TCR.
int[][] cf3 = new int [n][2];
int [] cf4 = new int [n-1];
int[] c = new int [n-1];

void setup() {
  int[] bezs = new int[2];
  int k;
  primos = HallaPrimos (n);
  for (int i = 0; i < n; i++) prC [i] = primos [i]*primos[i];
  // Marco las dos primeras filas de coeficientes.
  // (valor inicial y módulo)
  for (int i = 0; i < n-1; i++) {
    bezs = bez (prC [i], prC [i+1]);
    if (i%2 == 0) {
      cf1[i][0] = bezs [0];
      cf1[i+1][0] = bezs [1];
      cf1[i][1] = prC [i+1];
      cf1[i+1][1] = prC [i];
    } else {
      cf2[i-1][0] = bezs [0];
      cf2[i][0] = bezs [1];
      cf2[i-1][1] = prC [i+1];
      cf2[i][1] = prC [i];
    }
  }
  // Arreglo las dos primeras filas de índices
  // para ordenar los consecutivos.
  for (int i = 0; i < n-1; i+=2) {
    if (cf1 [i][0] > 0) {
      while (cf1 [i][0] > 0) {
        cf1 [i][0] -= cf1 [i][1];
        cf1 [i+1][0] += cf1 [i+1][1];
      }
    }
    if (cf2 [i][0] > 0) {
      while (cf2 [i][0] > 0) {
        cf2 [i][0] -= cf2 [i][1];
        cf2 [i+1][0] += cf2 [i+1][1];
      }
    }
  }
  */
  
  // TCR:
  
  /*
  int [] cond = new int [4];
    cond [0] = cf1 [1][0];
    cond [1] = cf1 [1][1];
    cond [2] = cf2 [0][0];
    cond [3] = cf2 [0][1];
    int [] sop = new int [2];
    sop = tcrA (cond);
    cf3 [0][0] = sop [0];
    cf3 [0][1] = sop [1];
    // Lo arreglo para dejarlos positivos.
    if (cf3[0][0] < 0) {
      while (cf3 [0][0] < 0) {
        cf3 [0][0] += cf3 [0][1];
      }
    }
    // Lo arreglo para ajustar el módulo.
    cf3 [0][0] = cf3 [0][0] % cf3 [0][1];
  
  
  
    int [] cond1 = new int [4+2];
    cond1 [0] = cf1 [2][0];
    cond1 [1] = cf1 [1+1][1];
    cond1 [2] = cf2 [1][0];
    cond1 [3] = cf2 [1][1];
    for (int j = 0; j < 1; j++) {
      cond1 [4+2*j] = cf3 [j][0];
      cond1 [5+2*j] = cf3 [j][1];
    }
    int [] sop1 = new int [2];
    sop1 = tcrA (cond1);
    cf3 [1][0] = sop1 [0];
    cf3 [1][1] = sop1 [1];
    // Lo arreglo para dejarlos positivos.
    if (cf3[1][0] < 0) {
      while (cf3 [1][0] < 0) {
        cf3 [1][0] += cf3 [1][1];
      }
    }
    // Lo arreglo para ajustar el módulo.
    cf3 [1][0] = cf3 [1][0] % cf3 [1][1];
  */
  /*
  
  for (int i = 0; i < n-2; i++) {
    int [] cond = new int [4+2*i];
    cond [0] = cf1 [i+1][0];
    cond [1] = cf1 [i+1][1];
    cond [2] = cf2 [i][0];
    cond [3] = cf2 [i][1];
    if (i > 0) for (int j = 0; j < i; j++) {
      cond [4+2*j] = cf3 [j][0];
      cond [5+2*j] = cf3 [j][1];
    }
    int [] sop = new int [2];
    sop = tcrA (cond);
    cf3 [i][0] = sop [0];
    cf3 [i][1] = sop [1];
    // Lo arreglo para dejarlos positivos.
    if (cf3[i][0] < 0) {
      while (cf3 [i][0] < 0) {
        cf3 [i][0] += cf3 [i][1];
      }
    }
    // Lo arreglo para ajustar el módulo.
    cf3 [i][0] = cf3 [i][0] % cf3 [i][1];
  }
  
  */
  
  // Calculo los coeficientes.
  
  /*
  cf4 [n-2] = cf3 [n-3][0];
  c [n-2] = cf4 [n-2] * prC [n-2];
  for (int i = n-3; i>=1; i--) {
    if (i%2 == 1) {
      k = (cf4[i+1] - cf2[i][0]) / cf2 [i][1];
      cf4 [i] = k * cf2 [i][1] - cf2 [i][0];
    } else {
      k = (cf4[i+1] - cf1[i+1][0]) / cf1 [i+1][1];
      cf4 [i] = k * cf1 [i][1] - cf1 [i][0];
    }
    c [i] = cf4 [i] * prC [i];
  }
  */
  
  /*
  background (0);
}

void draw() {
  fill (240);
  textSize (30);
  text ("P:", 100, 200);
  for (int i = 0; i < n; i++) {
    text (str (prC [i]), 300+150*i, 200);
    //if (i <2) text (str (bezp1p2 [i]), 300+200*i, 600);
  }
  text ("f1,0:", 100, 300);
  text ("f1,1:", 100, 400);
  text ("f2,0:", 100, 500);
  text ("f2,1:", 100, 600);
  text ("f3,0:", 100, 700);
  text ("f3,1:", 100, 800);
  for (int j = 0; j < 2; j++) 
    for (int i = 0; i < n; i++) {
      text (str (cf1 [i][j]), 300+150*i, 300+100*j);
      text (str (cf2 [i][j]), 450+150*i, 500+100*j);
      text (str (cf3 [i][j]), 450+150*i, 700+100*j);
    }
  for (int i = 0; i < n-1; i++) {
    fill (200,0,0);
    text (str (cf4 [n-2-i]), 300+150*(n-2-i),900);
    fill (240);
    text (str (c [n-2-i]), 300+150*(n-2-i), 1000);
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

int[] tcr (int a1, int ma1, int a2, int ma2) {
  int [] b = new int [2];
  int [] sal = new int [2];
  if (ma1%ma2 == 0) {
    // ma1 y ma2 no son coprimos.
  } else {
    b = bez (ma1, ma2);
    sal [0] = a1*ma2*b[1] + a2*ma1*b[0];
    // mcm. Para el caso, es este.
    sal [1] = ma1*ma2;
  }
  return sal;
}

int[] tcrA (int [] a) {
  int[] sal = new int [2];
  if (a.length % 2 == 1) {
    // mal vector de entrada.
  } else {
    // Comprueba si todos son coprimos.
    // Se puede mejorar. No lo veo necesario.
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
*/