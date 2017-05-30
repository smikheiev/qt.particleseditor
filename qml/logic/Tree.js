.pragma library

function Tree() {
    var node = new Node("root");
    this._root = node;
}

function Node(data) {
    this.data = data;
    this.parent = null;
    this.kids = [];
}

Tree.prototype.print = function(tree) {
    this.traverse(function(node){
        console.log(node.data);
    });
}

Tree.prototype.traverse = function(callback) {
    var queue = [this._root];

    var node = queue.shift();
    while (node) {
        if (callback(node) === true) {
            break;
        }

        for (var i = 0, length = node.kids.length; i < length; ++i) {
            queue.push(node.kids[i]);
        }

        node = queue.shift();
    }
}

Tree.prototype.add = function(data, parentData) {
    if (this.find(data) !== null) {
        throw new Error("add(): Node with such data already exists: " + data);
    }

    var parentNode;

    if (parentData === undefined) {
        parentNode = this._root;
    } else {
        parentNode = this.find(parentData);
        if (parentNode === null) {
            throw new Erorr("add(): Can not find node with data: " + parentData);
        }
    }

    var node = new Node(data);
    node.parent = parentNode;
    parentNode.kids.push(node);
}

Tree.prototype.remove = function(data) {
    var node = this.find(data);
    if (node === null) {
        throw new Error("remove(): Can not find node with data: " + data);
    }

    if (node === this._root) {
        throw new Error("remove(): Can not remove root node: " + data);
    }

    var index = node.parent.kids.indexOf(node);
    node.parent.kids.splice(index, 1);

    return node;
}

Tree.prototype.find = function(data) {
    var resultNode = null;
    this.traverse(function(node) {
        if (node.data === data) {
            resultNode = node;
            return true;
        }
        return false;
    });

    return resultNode;
}

Tree.prototype.getNeighbour = function(data) {
    var node = this.find(data);
    if (node === null || node === this._root) {
        return null;
    }

    if (node.parent.kids.length === 1) {
        return null;
    }

    var index = node.parent.kids.indexOf(node);
    if (index === node.parent.kids.length - 1) {
        return node.parent.kids[index - 1].data;
    } else {
        return node.parent.kids[index + 1].data;
    }
}

Tree.prototype.getParent = function(data) {
    var node = this.find(data);
    if (node === null || node === this._root) {
        return null;
    }

    return node.parent.data;
}

Tree.prototype.getAnyParent = function(data, compareFunction) {
    var node = this.find(data);
    var parentNode = node.parent;
    while (parentNode && !compareFunction(parentNode.data)) {
        parentNode = parentNode.parent;
    }

    return parentNode.data;
}
