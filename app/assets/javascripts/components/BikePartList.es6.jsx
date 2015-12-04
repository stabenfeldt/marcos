class BikePartList extends React.Component {

    constructor(props) {
      super(props);
      this.state = {
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

    /*
    customer_bike_parts GET    /customers/:customer_id/bikes/:bike_id/parts(.:format) bikes#parts
                        POST   /customers/:customer_id/bikes/:bike_id/:id(.:format)   bikes#add_part
                        DELETE /customers/:customer_id/bikes/:bike_id/:id(.:format)   bikes#remove_part
    */

    addPart(part) {
        var updatedUsedParts      = this.state.usedParts;
        var updatedAvailableParts = this.state.availableParts;
        var bikeID = ''

        // Add to list of used
        updatedUsedParts.push(part)
        // Remove from available
        updatedAvailableParts = _.without(updatedAvailableParts, _.findWhere(updatedUsedParts, part));

        this.setState({
          usedParts: updatedUsedParts,
          availableParts: updatedAvailableParts
        })

        fetch('/customers/'+this.props.bike.customer_id+'/bikes/'+this.props.bike.id+'/'+part.id, {
          credentials: 'same-origin',
          method: 'post',
          body: 'test'
        })

    }

    removePart(part) {
        var updatedUsedParts      = this.state.usedParts;
        var updatedAvailableParts = this.state.availableParts;

        // Add to list of available
        updatedAvailableParts.push(part)
        // Remove from available
        updatedUsedParts = _.without(this.state.usedParts, _.findWhere(this.state.usedParts, part));

        this.setState({
          usedParts: updatedUsedParts,
          availableParts: updatedAvailableParts
        })

        fetch('/customers/'+this.props.bike.customer_id+'/bikes/'+this.props.bike.id+'/'+part.id, {
          credentials: 'same-origin',
          method: 'delete',
          body: 'test'
        })
    }



    render () {

        // Available parts
        var availablePartsList = this.state.availableParts.map( (part) => {
            return (
                <Part {...part} hide_menu="true"
                 whenClicked={this.addPart.bind(this, part)} />
            )
        });


        //// Used parts
        var usedPartsList = this.state.usedParts.map( (part) => {
            return (
                <Part {...part} hide_menu="true"
                 whenClicked={this.removePart.bind(this, part)} />
            )
        });

        return(
            <div className="list-group">
                <h3> Tilgjengelig </h3>
                <div className="alert alert-info">
                  {availablePartsList}
                </div>
                <h3> Valgte </h3>
                <div className="alert alert-success">
                  {usedPartsList}
                </div>
            </div>
        );
    }
}
