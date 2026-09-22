
let times=0;

const syncDB=()=>{
    times++;
    console.log('Ejecutandose en multiplos de 5 segundos', times);

    return times;
}

module.exports={
    syncDB
}