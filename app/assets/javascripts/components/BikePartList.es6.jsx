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

        var updatedUsedParts      = this.state.usedParts;
        var updatedAvailableParts = this.state.availableParts;

        // Add to list of used
        updatedUsedParts.push(element)
        // Remove from available
        updatedAvailableParts = _.without(updatedAvailableParts, _.findWhere(updatedUsedParts, element));

        console.log("Used: ", updatedUsedParts);
        console.log("Available: ", updatedAvailableParts);


        this.setState({
          usedParts: updatedUsedParts,
          availableParts: updatedAvailableParts
        })
    }

    removePart(element) {
        console.log("remove element: ", element.id);
        var updatedUsedParts      = this.state.usedParts;
        var updatedAvailableParts = this.state.availableParts;

        // Add to list of available
        updatedAvailableParts.push(element)
        // Remove from available
        updatedUsedParts = _.without(this.state.usedParts, _.findWhere(this.state.usedParts, element));

        console.log("Used: ", updatedUsedParts);
        console.log("Available: ", updatedAvailableParts);


        this.setState({
          usedParts: updatedUsedParts,
          availableParts: updatedAvailableParts
        })
    }



    render () {

        // Available parts
        var availablePartsList = this.state.availableParts.map( (element) => {
            return (
                <Part {...element} hide_menu="true"
                 whenClicked={this.addPart.bind(this, element)} />
            )
        });



        //// Used parts
        var usedPartsList = this.state.usedParts.map( (element) => {
            return (
                <Part {...element} hide_menu="true"
                 whenClicked={this.removePart.bind(this, element)} />
            )
        });

        return(
            <div className="list-group">
                <h3> Available </h3>
                {availablePartsList}
                <h3> Used </h3>
                {usedPartsList}
            </div>
        );
    }
}
