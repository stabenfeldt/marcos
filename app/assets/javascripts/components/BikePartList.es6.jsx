class BikePartList extends React.Component {
    handleClick() {
        alert('hi')
    }

    render () {
        var availableParts = this.props.availableParts
        var usedParts      = this.props.usedParts

        var list = this.props.items.map(function (element) {
            return <Part {...element} hide_menu="true" whenClicked={this.handleClick} />
        });
        return(
            <div className="list-group">
                {list}
            </div>
        );
    }
}
