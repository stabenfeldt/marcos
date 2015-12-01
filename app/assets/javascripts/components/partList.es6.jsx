class PartList extends React.Component {
  render () {
      var list = this.props.items.map(function (element) {
          return <Part {...element} hide_menu="true" />
      });
    return(
        <div className="list-group">
          {list}
        </div>
    );
  }
}
