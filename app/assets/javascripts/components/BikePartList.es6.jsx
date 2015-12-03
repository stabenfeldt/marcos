class BikePartList extends React.Component {
    getInitalState() {
        return {
            availableParts: [],
            usedParts: []
        }
    }

    componentDidMount() {
      this.setState( {
        availableParts: this.props.availableParts,
        usedParts: this.props.usedParts
      })
    }

    addPart(element) {
        console.log("add element: ", element.id);
        //usedParts.push(element);
        //this.state.availableParts.pop(element);
    }

    removePart(element) {
        console.log("remove element: ", element.id);
    }

    render () {

        // Available parts
        var availablePartsList = this.props.availableParts.map( (element) => {
            return (
                <Part {...element} hide_menu="true"
                 whenClicked={this.addPart(element)} />
            )
        });

        //// Used parts
        //var usedPartsList = this.props.usedParts.map( (element) => {
        //    return (
        //        <Part {...element} hide_menu="true"
        //         whenClicked={this.removePart(element)} />
        //    )
        //});

        return(
            <div className="list-group">
                <strong> Available </strong>
                {availablePartsList}
                <strong> Used </strong>
            </div>
        );
    }
}
