class Part extends React.Component {
    render () {
        return (
            <div className="list-group-item"
                key={this.props.id}
                onClick={this.props.whenClicked}>

                <div className={this.props.hide_menu ? 'hidden' : 'pull-right'}>
                  <a href={'parts/'+this.props.id+'/edit'}> Rediger </a>
                  <a href={'parts/'+this.props.id} data-method="delete"> Slett </a>
                </div>

                <h4> {this.props.brand} - {this.props.model} </h4>
                <em> {this.props.year} </em>
                <span>{this.props.note}</span>

            </div>
        );
    }
}

Part.propTypes = {
    brand: React.PropTypes.string,
    model: React.PropTypes.string,
    year: React.PropTypes.node,
    note: React.PropTypes.string
};
