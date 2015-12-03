class BikePartList extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
            availableParts: [],
            usedParts: []
      }
    }

    componentDidMount() {
      console.log("did mount");
      this.setState( {
        availableParts: this.props.availableParts,
        usedParts: this.props.usedParts
      })
      console.log("STate: ", this.state);
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
      var availablePartsList;
      if (this.state.availableParts) {
        // Available parts
        availablePartsList = this.state.availableParts.map( (element) => {
            return (
                <Part {...element} hide_menu="true"
                 whenClicked={this.addPart.bind(this, element)} />
            )
        });

      }


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
