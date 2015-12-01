class BikePartList extends React.Component {
    yo() {
        alert('yo')
    }

    render () {
        var availableParts = this.props.availableParts
        var usedParts      = this.props.usedParts

        var list = this.props.items.map( (element) => {
            return <Part {...element} hide_menu="true" whenClicked={this.yo} />
        });
        return(
            <div className="list-group">
                {list}
            </div>
        );
    }
}
