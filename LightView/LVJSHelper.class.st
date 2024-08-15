"
I am a class which contains the helper library to change dom on client side.
"
Class {
	#name : 'LVJSHelper',
	#superclass : 'LVHtml',
	#category : 'LightView-js',
	#package : 'LightView',
	#tag : 'js'
}

{ #category : 'rendering' }
LVJSHelper >> html [

	h script: self script.
]

{ #category : 'accessing' }
LVJSHelper >> script [

	^ '    function parseHTML(htmlString) {
            const parser = new DOMParser();
            const doc = parser.parseFromString(htmlString, ''text/html'');
            return doc.body.firstChild;
        }

        function getTargetNode(nodeId) {
            const node = document.getElementById(nodeId);
            if (!node) {
                console.error(`Node with id "${nodeId}" not found.`);
            }
            return node;
        }

        function replaceOuterNode(htmlString, nodeId) {
            const newNode = parseHTML(htmlString);
            const targetNode = getTargetNode(nodeId);
            if (targetNode && targetNode.parentNode) {
                targetNode.parentNode.replaceChild(newNode, targetNode);
                return true;
            }
            return false;
        }

        function replaceInnerNode(htmlString, nodeId) {
            const targetNode = getTargetNode(nodeId);
            if (targetNode) {
                targetNode.innerHTML = htmlString;
                return true;
            }
            return false;
        }

        function appendToNode(htmlString, nodeId) {
            const newNode = parseHTML(htmlString);
            const targetNode = getTargetNode(nodeId);
            if (targetNode) {
                targetNode.appendChild(newNode);
                return true;
            }
            return false;
        }

        function prependToNode(htmlString, nodeId) {
            const newNode = parseHTML(htmlString);
            const targetNode = getTargetNode(nodeId);
            if (targetNode) {
                targetNode.insertBefore(newNode, targetNode.firstChild);
                console.log(`Content prepended to node with id "${nodeId}".`);
                return true;
            }
            return false;
        }

        function deleteNode(nodeId) {
            const targetNode = getTargetNode(nodeId);
            if (targetNode && targetNode.parentNode) {
                targetNode.parentNode.removeChild(targetNode);
                console.log(`Node with id "${nodeId}" has been deleted.`);
                return true;
            }
            return false;
        }

        function handleManipulation(action) {
            const htmlString = document.getElementById(''htmlInput'').value;
            const nodeId = document.getElementById(''nodeId'').value;
            
            switch(action) {
                case ''replace-outer'':
                    replaceOuterNode(htmlString, nodeId);
                    break;
                case ''replace-inner'':
                    replaceInnerNode(htmlString, nodeId);
                    break;
                case ''append'':
                    appendToNode(htmlString, nodeId);
                    break;
                case ''prepend'':
                    prependToNode(htmlString, nodeId);
                    break;
                case ''delete'':
                    deleteNode(nodeId);
                    break;
            }
        }
    '
]
