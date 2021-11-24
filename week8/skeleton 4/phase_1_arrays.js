Array.prototype.uniq = function() {
    let uniqArray = [];
    for (let  i=0; i < this.length; i++) {
        if (!uniqArray.includes(this[i])) {
            uniqArray.push(this[i]);
        }
    }
    return uniqArray;
}

// console.log([1, 1, 2, 2, 3, 3, 4, 4, 5, 5].uniq());

Array.prototype.twoSum = function() {
    let pairs = [];
    const hash = {};

    this.forEach((ele, idx) => {
        if (hash[ele * -1] ) {
            pairs.push([hash[ele * -1], idx])
        } else {
            hash[ele] = idx
        }
    })
    return pairs
}

console.log([-1, 0, 2, -2, 1].twoSum());

Array.prototype.transpose = function() {
  const columns = Array.from(
    { length: this[0].length },
    () => Array.from({ length: this.length })
  );

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      columns[j][i] = this[i][j];
    }
  }

  return columns;
};

// console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());