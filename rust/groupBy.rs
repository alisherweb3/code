// a finir
    let mut v=vec![......];
    let l=v.len();
    let mut o="".to_owned();
    let mut i=0;
    while i<v.len() {
        let n=v[i];
        let mut c=1;
        while i+1<l && v[i+1]==n {
            i+=1;
            c+=1;
        }
        if (c&1)==1 {o.push(n)}
        i+=1;
    }
    if o==s {return o}
    doubles(&o)
}